# Utiliza la imagen base de .NET SDK para compilar la aplicación
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Define el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo del proyecto y restaura las dependencias
COPY *.csproj ./
RUN dotnet restore

# Copia el resto de los archivos de la aplicación
COPY . ./

# Compila la aplicación
RUN dotnet publish -c Release -o out

# Utiliza la imagen base de ASP.NET Core Runtime para ejecutar la aplicación
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

# Define el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos compilados desde la etapa anterior
COPY --from=build /app/out .

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 5293

# Define el comando para ejecutar la aplicación
ENTRYPOINT ["dotnet", "HolaMundoAPI.dll"]
