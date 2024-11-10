var builder = WebApplication.CreateBuilder(args);

// Cambiar el puerto a 5293
builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(5293);  // Cambiar el puerto aquí
});

// Agregar los servicios y Swagger como antes
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configurar Swagger y los controladores
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapControllers();

app.Run();