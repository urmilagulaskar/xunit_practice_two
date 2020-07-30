FROM node:12

# nice clean home for our action files
RUN mkdir /action
WORKDIR /action


# install node deps(for semantic versioning)
COPY ./package.json ./
RUN npm ci 

# copy csproj and restore as distinct layers
COPY *.sln .
COPY TimeManagementBooking/*.csproj ./TimeManagementBooking/
RUN dotnet restore

# copy everything else and build app
COPY TimeManagementBooking/. ./TimeManagementBooking/
WORKDIR /action/TimeManagementBooking
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS runtime
WORKDIR /action
COPY --from=build /action/TimeManagementBooking/out ./

# copy in entrypoint after dependency installation
COPY entrypoint.js .

ENTRYPOINT ["node", "/action/entrypoint.js"]
