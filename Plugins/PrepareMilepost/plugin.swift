import Foundation
import PackagePlugin

@main
struct PrepareMilepost: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let executableURL = try context.tool(named: "bundle-generator").url

        let outputFilesDir = context.pluginWorkDirectoryURL
            .appending(path: target.name)
            .appending(path: "Resources")
        let outputURL = outputFilesDir.appending(path: "revision-plate.plist")

        return [
            .buildCommand(
                displayName: "Prepare Milepost",
                executable: executableURL,
                arguments: [
                    context.package.directoryURL.path(percentEncoded: false),
                    outputURL.path(percentEncoded: false),
                ],
                outputFiles: [
                    outputURL,
                ]
            ),
        ]
    }
}

#if canImport(XcodeProjectPlugin)

import XcodeProjectPlugin

extension PrepareMilepost: XcodeBuildToolPlugin {
    func createBuildCommands(context: XcodeProjectPlugin.XcodePluginContext, target: XcodeProjectPlugin.XcodeTarget) throws -> [PackagePlugin.Command] {
        let executableURL = try context.tool(named: "bundle-generator").url

        let outputFilesDir = context.pluginWorkDirectoryURL
        let outputURL = outputFilesDir.appending(path: "revision-plate.plist")

        return [
            .buildCommand(
                displayName: "Prepare Milepost",
                executable: executableURL,
                arguments: [
                    context.xcodeProject.directoryURL.path(percentEncoded: false),
                    outputURL.path(percentEncoded: false),
                ],
                outputFiles: [
                    outputURL,
                ]
            ),
        ]

    }
}

#endif
