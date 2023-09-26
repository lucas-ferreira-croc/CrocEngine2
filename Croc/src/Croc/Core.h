#pragma once

#ifdef CROC_PLATFORM_WINDOWS
	#ifdef CROC_BUILD_DLL
		#define CROC_API __declspec(dllexport)
	#else
		#define CROC_API __declspec(dllimport)
	#endif
#else
	#error Croc only support windows!
#endif