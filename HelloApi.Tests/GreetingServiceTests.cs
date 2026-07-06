using HelloApi.Services;

namespace HelloApi.Tests;

public class GreetingServiceTests
{
    private readonly GreetingService _sut = new();

    [Fact]
    public void Greet_ValidName_ReturnsExpectedMessage()
    {
        var result = _sut.Greet("Berka");

        Assert.Equal("Merhaba, Berka! CI/CD sanal makinede calisiyor.", result);
    }

    [Theory]
    [InlineData("")]
    [InlineData("   ")]
    public void Greet_EmptyOrWhitespaceName_ThrowsArgumentException(string name)
    {
        Assert.Throws<ArgumentException>(() => _sut.Greet(name));
    }
}
