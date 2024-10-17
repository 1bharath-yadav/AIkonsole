#!/bin/bash

# Load the configuration file
source /etc/AIkonsole.conf

# Check if API_KEY is set
if [ -z "$API_KEY" ]; then
  echo "API_KEY is not set. Please set the environment variable API_KEY."
  exit 1
fi

# Prompt
read -p "Enter your prompt: " PROMPT

# Making a request to the API
for ((i=1; i<=$RETRY_COUNT; i++)); do
  RESPONSE=$(curl -s -H 'Content-Type: application/json' \
      -m "$API_TIMEOUT" \
      -d "{\"contents\":[{\"parts\":[{\"text\":\"$PROMPT\"}]}]}" \
      -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$API_KEY")

  # Capture curl's exit status
  CURL_STATUS=$?

  if [ $CURL_STATUS -eq 0 ]; then
    # If successful, extract and display the answer
    ANSWER=$(echo "$RESPONSE" | jq -r '.candidates[0].content.parts[0].text')
    echo "Response: $ANSWER"
    break
  elif [ $CURL_STATUS -eq 28 ]; then
    # If curl timed out
    echo "Error: API request timed out after $API_TIMEOUT seconds."
  else
    # Handle other errors (like connection issues)
    echo "Error: API request failed (curl status: $CURL_STATUS)."
  fi

  # If it's not the last attempt, wait before retrying
  if [ $i -lt $RETRY_COUNT ]; then
    echo "Retrying in $RETRY_DELAY seconds..."
    sleep "$RETRY_DELAY"
  fi
done

# If all retries fail, notify the user
if [ $i -eq $RETRY_COUNT ] && [ $CURL_STATUS -ne 0 ]; then
  echo "Error: All attempts to connect to the API failed."
fi

#logging
if [ "$LOGGING" = "yes" ]; then
  echo "[$(date)] Prompt: $PROMPT | Response: $ANSWER" >> "$LOG_FILE"
fi

### output formatt detailed or plain
if [ "$OUTPUT_FORMAT" = "detailed" ]; then
  echo "Full Response: $RESPONSE"
else
  echo "Response: $ANSWER"
fi

###Language
if [ "$DEFAULT_LANGUAGE" != "" ]; then
  PROMPT="$PROMPT (Language: $DEFAULT_LANGUAGE)"
fi

