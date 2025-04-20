# Use the official .NET runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 5080

# Use the .NET SDK image to build the app (optional if you already built it locally)
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src

# Copy published files directly (since you've already built locally)
FROM base AS final
WORKDIR /app
COPY . .

ENTRYPOINT ["dotnet", "sample.dll"]
