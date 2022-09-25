import Foundation
import PackagePlugin
import XcodeProjectPlugin

@main
struct PrepareMilepost: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let executablePath = try context.tool(named: "bundle-generator").path
        
        let outputFilesDir = context.pluginWorkDirectory.appending(target.name, "Resources")
        let outputPath = outputFilesDir.appending(subpath: "revision-plate.plist")
        
        return [
            .buildCommand(
                displayName: "Prepare Milepost",
                executable: executablePath,
                arguments: [
                    target.directory,
                    "--output-path",
                    outputPath.string
                ],
                outputFiles: [
                    outputPath,
                ]
            ),
        ]
    }
}

extension PrepareMilepost: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodeProjectPlugin.XcodePluginContext, target: XcodeProjectPlugin.XcodeTarget) throws -> [PackagePlugin.Command] {
        let executablePath = try context.tool(named: "bundle-generator").path
        
        let outputFilesDir = context.pluginWorkDirectory
        let outputPath = outputFilesDir.appending(subpath: "revision-plate.plist")
        
        return [
            .buildCommand(
                displayName: "Prepare Milepost",
                executable: executablePath,
                arguments: [
                    context.xcodeProject.directory,
                    "--output-path",
                    outputPath.string
                ],
                outputFiles: [
                    outputPath,
                ]
            ),
        ]
        
    }
}