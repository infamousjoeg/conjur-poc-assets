#!/bin/sh

# Create a Build Step in Job1 to "Execute Shell"
# COPY BELOW INTO THE BUILD STEP, NOT ABOVE THIS COMMENT
echo "$TEST_USERNAME" | sed 's/./& /g'
echo "$TEST_PASSWORD" | sed 's/./& /g'