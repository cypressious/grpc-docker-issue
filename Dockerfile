FROM microsoft/dotnet:2.1.300-sdk-alpine AS builder
WORKDIR /

COPY . .
RUN dotnet publish WebApplication2/WebApplication2.csproj -o /dockerout/ -c Release

FROM microsoft/dotnet:2.1.0-aspnetcore-runtime-alpine
WORKDIR /app
EXPOSE 80

COPY --from=builder /dockerout .

ENTRYPOINT ["dotnet", "WebApplication2.dll"]