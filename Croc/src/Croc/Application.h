#pragma once

#include "Core.h"

namespace Croc
{
	class CROC_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};
	
	//should be defined in client
	Application* CreateApplication();
}

