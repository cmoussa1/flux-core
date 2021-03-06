#!/bin/sh -e
# submit a job with json-null and ensure it doesn't cause the shell
#  to segfault

# test-prereqs: HAVE_JQ
flux job attach -vEX $(flux mini run --dry-run hostname \
    | jq .attributes.system.shell.options.foo=null \
    | flux job submit)
