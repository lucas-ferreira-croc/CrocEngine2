#pragma once

#ifdef CROC_PLATFORM_WINDOWS

extern Croc::Application* Croc::CreateApplication();

int main(int argc, char** argv)
{
	Croc::Log::Init();
	CROC_CORE_WARN("Initialized Log!");

	int a = 5;
	CROC_INFO("Initialized Log! var = {0}", a);

	auto app = Croc::CreateApplication();
	app->Run();
	delete app;
}

#endif
