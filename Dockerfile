FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.sln .
COPY TimeManagementBooking/*.csproj ./TimeManagementBooking/
RUN dotnet restore

# Copy everything else and build app
COPY TimeManagementBooking/. ./TimeManagementBooking
WORKDIR /app/TimeManagementBooking
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/TimeManagementBooking/out .
ENTRYPOINT ["dotnet", "TimeManagementBooking.dll"]