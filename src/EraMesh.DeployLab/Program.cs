var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => Results.Text("EraMesh Deploy Lab OK", "text/plain"));
app.MapGet("/health", () => Results.Ok(new
{
    status = "healthy",
    service = "eramesh-deploy-lab",
    version = Environment.GetEnvironmentVariable("APP_VERSION") ?? "dev"
}));

app.Run();
