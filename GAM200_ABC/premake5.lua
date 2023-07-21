-- premake5.lua
workspace "GAM200_ABC"
	architecture "x64"

	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.system}-%{cfg.architecture}"

	project "GAM200_ABC"
		location "GAM200_ABC"

		kind "StaticLib"
		staticruntime "On"

		language "C++"
		cppdialect "C++17"

		targetdir ("bin/" .. outputdir .. "/%({prj.name})")
		objdir ("bin-int/" .. outputdir .. "/%({prj.name})")

		pchheader "pch.h"
		pchsource "GAM200_ABC/src/pch.cpp"

		files
		{
			"%{prj.name}/include/**.h",
			"%{prj.name}/src/**.cpp"
		}

		includedirs
		{
			"%{prj.name}/src",
			"%{prj.name}/include"
		}

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
		runtime "Release"
		optimize "on"

	project "Sandbox"
		location "Sandbox"

		kind "ConsoleApp"
		staticruntime "On"

		language "C++"
		cppdialect "C++17"

		targetdir ("bin/" .. outputdir .. "/%({prj.name})")
		objdir ("bin-int/" .. outputdir .. "/%({prj.name})")

		files
		{
			"%{prj.name}/include/**.h",
			"%{prj.name}/src/**.cpp"
		}

		includedirs
		{
			"GAM200_ABC/src",
			"GAM200_ABC/include"
		}

		links
		{
			"GAM200_ABC"
		}

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
		runtime "Release"
		optimize "on"