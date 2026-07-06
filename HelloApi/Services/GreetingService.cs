namespace HelloApi.Services;

public class GreetingService
{
    public string Greet(string name)
    {
        if (string.IsNullOrWhiteSpace(name))
            throw new ArgumentException("Name cannot be empty.", nameof(name));

        return $"Merhaba, {name}! CI/CD sanal makinede calisiyor.";
    }
}
