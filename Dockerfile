FROM mcr.microsoft.com/dotnet/aspnet:5.0-alpine AS base

WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build

WORKDIR /src

COPY ["src/CRM.Web/CRM.Web.csproj", "src/CRM.Web/"]
COPY ["src/CRM.Core/CRM.Core.csproj", "src/CRM.Core/"]
COPY ["src/CRM.Infrastructure/CRM.Infrastructure.csproj", "src/CRM.Infrastructure/"]
COPY ["src/CRM.SharedKernel/CRM.SharedKernel.csproj", "src/CRM.SharedKernel/"]

WORKDIR /src

RUN dotnet restore "src/CRM.Web/CRM.Web.csproj"
COPY . .
WORKDIR "/src/src/CRM.Web"

# set this to Debug if you need debug build
RUN dotnet build "CRM.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CRM.Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app

COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CRM.Web.dll"]