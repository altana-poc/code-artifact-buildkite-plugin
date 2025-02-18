#!/usr/bin/env bats

load "${BATS_PLUGIN_PATH}/load.bash"

load "$PWD/hooks/environment"

@test "login_code_artifact" {
    assert_equal "Hello world" "Hello world"
}