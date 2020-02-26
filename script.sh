#!/bin/sh

command="firebase appdistribution:distribute"
command="${command} \"/drone/src/$PLUGIN_FILE_PATH\""
command="${command} --token $PLUGIN_TOKEN"
command="${command} --app $PLUGIN_APP"
if ! [[ -z "$PLUGIN_RELEASE_NOTES" ]]; then
    command="${command} --release-notes \"$PLUGIN_RELEASE_NOTES\""
fi
if ! [[ -z "$PLUGIN_RELEASE_NOTES_FILE" ]]; then
    command="${command} --release-notes-file \"$PLUGIN_RELEASE_NOTES_FILE\""
fi
if ! [[ -z "$PLUGIN_TESTERS" ]]; then
    command="${command} --testers \"$PLUGIN_TESTERS\""
fi
if ! [[ -z "$PLUGIN_TESTERS_FILE" ]]; then
    command="${command} --testers-file \"$PLUGIN_TESTERS_FILE\""
fi
if ! [[ -z "$PLUGIN_GROUPS" ]]; then
    command="${command} --groups \"$PLUGIN_GROUPS\""
fi
if ! [[ -z "$PLUGIN_GROUPS_FILE" ]]; then
    command="${command} --groups-file \"$PLUGIN_GROUPS_FILE\""
fi
if ! [[ -z "$PLUGIN_DEBUG" ]]; then
    command="${command} --debug"
fi

echo "The firebase CLI command to run: '$command'"
eval "$command"
