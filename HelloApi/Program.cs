using HelloApi.Services;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<GreetingService>();

var app = builder.Build();

app.MapGet("/", () => "Merhaba Creamobile! deneme 5  - otomatik deploy calisiyor.");

app.MapGet("/greet/{name}", (string name, GreetingService svc) => svc.Greet(name));

app.Run();
