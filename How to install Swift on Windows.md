# Как да инсталираме Swift на Windows?

Вички стъпки са базирани на следния [материал](https://www.swift.org/getting-started/#installing-swift).

1. Трябва да се активира режим за разработка (developer mode).
Следвайте стъпките [тук](https://learn.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development).

1. Трябва да се инсталират следните програми:
 * git
 * python
2. Трябва да се инсталират и:
 * Visual Studio 2022 Community
 * Visual Studio Build Tools
 * Windows 10 SDK

След това се изпълнява командата за инсталиране на `Swift`:

```
winget install Swift.Toolchain
```

След приключването на тази команда с успех, трябва да можете да стартирате `Swift` компилатора.

Примерно, следната команда трябва да даде резултат:

```
swift --version
```


> Настоящия гайд беше изготвен с помощта на Светослав Максимов. 