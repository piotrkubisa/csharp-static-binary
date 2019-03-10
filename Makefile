all: deps build

deps: deps-nuget deps-linux

deps-nuget:
	# dotnet new nuget
	# Include <add key="dotnet-core" value="https://dotnet.myget.org/F/dotnet-core/api/v3/index.json" />
	dotnet add package Microsoft.DotNet.ILCompiler -v '1.0.0-alpha-*'

deps-linux:
	sudo apt install libcurl4-openssl-dev zlib1g-dev libkrb5-dev
	sudo apt install clang-3.9

build:
	dotnet publish -r linux-x64 -c release
