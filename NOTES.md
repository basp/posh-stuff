# PowerShell Tricks
## Getting help
PowerShell help is excellent. You can get a long way by starting out just by
invoking the `get-help` cmdlet. You also probably want to run the
`update-help` cmdlet as well in order to have all the detailed info and
examples readily available.

PowerShell has very nice reflective capabilities. These allow you to stay
mostly inside the shell and use that to find out what you can do with the
objects that you are dealing with.

## Reflection
The basic way to inspect objects is using the `get-member` cmdlet.

    > $obj = new-object system.collections.generic.list[string]
    > $obj | get-member
    
To get the static methods we can use the `static` flag.

    > $obj | get-member -static

For example, PowerShell includes a collection of `TypeAccelerators`. In 
order to find out what accelerators are available we can inspect that type.

    > $name = "System.Management.Automation.TypeAccelerators"
    > $type = [psobject].Assembly.GetType($name)
    
If we take a look at its static members we find a `Get` method.

    > $type | get-member -static

And if we invoke that method we get a list of all the type accelerators
that your PowerShell environment supports.

    > $type::get

Note that all the classes in the `System` namespace are *automagically*
aliased so that, for example, to get at the `System.Math` class you can just
type `[math]` instead.