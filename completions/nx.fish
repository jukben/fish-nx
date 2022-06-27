function __nx_run
    if test -e workspace.json; and type -q jq
        jq -r '.projects | to_entries | map("\(.key as $project | .value.targets | keys | map("\($project):\(.)") | .[])") | .[]' workspace.json
    end
end

function __nx_workspace_schematic
    if test -d tools/schematics
        # very silly way how to get only folder name in format we want
        ls -d tools/schematics/*/ | sed 's/.$//' | sed 's/tools\/schematics\///'
    end
end


set -l nx_commands run generate affected run-many affected:apps affected:libs affected:build affected:test affected:e2e affected:dep-graph print-affected affected:lint dep-graph format:check format:write workspace-lint workspace-schematic migrate report list

complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a generate -d 'Generate code'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected -d 'Run task for affected projects'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a run-many -d 'Run task for multiple projects'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected:apps -d 'Print applications affected by changes'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected:libs -d 'Print libraries affected by changes'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected:build -d 'Build applications and publishable libraries affected by changes'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected:test -d 'Test projects affected by changes'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected:e2e -d 'Run e2e tests for the applications affected by changes'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected:dep-graph -d 'Graph dependencies affected by changes'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a print-affected -d 'Graph execution plan'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a affected:lint -d 'Lint projects affected by changes'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a dep-graph -d 'Graph dependencies within workspace'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a format:check -d 'Check for un-formatted files'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a format:write -d 'Overwrite un-formatted files'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a workspace-lint -d 'Lint workspace or list of files'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a migrate -d 'Creates a migrations file or runs migrations from the migrations file.'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a report -d 'Reports useful version numbers to copy into the Nx issue template'
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a list -d 'Lists installed plugins, capabilities of installed plugins and other available plugins.'

# run
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a run -d 'Run a target for a project'
complete -f -c nx -n "__fish_seen_subcommand_from run; and not __fish_seen_subcommand_from (__nx_run)" -a "(__nx_run)"
complete -f -c nx -n "__fish_seen_subcommand_from (__nx_run); and not __fish_seen_subcommand_from --" -a "--"

# workspace-schematic
complete -f -c nx -n "not __fish_seen_subcommand_from $nx_commands" -a workspace-schematic -d 'Runs a workspace schematic from the tools/schematics directory'
complete -f -c nx -n "__fish_seen_subcommand_from workspace-schematic; and not __fish_seen_subcommand_from (__nx_workspace_schematic)" -a "(__nx_workspace_schematic)"
complete -f -c nx -n "__fish_seen_subcommand_from (__nx_workspace_schematic); and not __fish_seen_subcommand_from --" -a "--"
