import Foundation
import PackagePlugin

struct RevisionGenerator: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let executablePath = try context.tool(named: "revision-generator").path
        return [
            .buildCommand(
                displayName: "Generate RevisionPlate data",
                executable: executablePath,
                arguments: [
                    target.directory.string,
                ]
            )
        ]
    }
}
