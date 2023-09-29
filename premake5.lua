workspace "Croc"
	architecture "x64" 

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Croc"
	location "Croc"
	kind "SharedLib"
	language "C++"
	
	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs 
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0"

		defines
		{
			"CROC_PLATFORM_WINDOWS",
			"CROC_BUILD_DLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "CROC_DEBUG"
		symbols "On"

	filter "configurations:Relase"	
		defines "CROC_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "CROC_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	
	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Croc/vendor/spdlog/include",
		"Croc/src"
	}

	links
	{
		"Croc"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0"

		defines
		{
			"CROC_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "CROC_DEBUG"
		symbols "On"

	filter "configurations:Relase"	
		defines "CROC_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "CROC_DIST"
		optimize "On"