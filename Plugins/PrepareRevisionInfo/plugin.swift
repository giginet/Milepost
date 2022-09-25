import Foundation
import PackagePlugin
import XcodeProjectPlugin

@main
struct PrepareRevisionInfo: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let executablePath = try context.tool(named: "revision-info-generator").path
        return [
            .buildCommand(
                displayName: "Prepare RevisionPlate info",
                executable: executablePath,
                arguments: [
                    target.directory.string,
                ]
            ),
        ]
    }
}

extension PrepareRevisionInfo: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodeProjectPlugin.XcodePluginContext, target: XcodeProjectPlugin.XcodeTarget) throws -> [PackagePlugin.Command] {
        let executablePath = try context.tool(named: "revision-info-generator").path
        return [
            .buildCommand(
                displayName: "Prepare RevisionPlate info",
                executable: executablePath,
                arguments: [
                    context.xcodeProject.directory
                ]
            ),
        ]
        
    }
}
