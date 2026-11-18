FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY src/EraMesh.DeployLab/EraMesh.DeployLab.csproj src/EraMesh.DeployLab/
RUN dotnet restore src/EraMesh.DeployLab/EraMesh.DeployLab.csproj
COPY src/EraMesh.DeployLab/ src/EraMesh.DeployLab/
RUN dotnet publish src/EraMesh.DeployLab/EraMesh.DeployLab.csproj \
    -c Release --no-restore -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080
COPY --from=build /app/publish .
USER $APP_UID
ENTRYPOINT ["dotnet", "EraMesh.DeployLab.dll"]
