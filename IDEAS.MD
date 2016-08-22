Oblique 2.0

* Process element on page
* Recollect info in 1 struct with types and instances,
 easy to iterate and search:
    * DirectiveTypeCollection[]
	    * DirectiveType
		    * DirectiveInstances[]
* Update the list with the changes on every DOM change (or 400 ms
if I don't know the changes in DOM)
* Use my events instead of "on" methods
* Easy params to use
* More than one model per page?
* Not jQuery dependent
* Use gulp instead of custom scripts
* Use karma instead of manual test execution
* Samples in Java and ASP.NET
* Compatible with Oblique 1

Infrastructure needed:

* event bus
* dom ready detection
* dom selection
* dom reading tags
* dom element storage
