Postman WebApi Help Documentation
================================

### Nuget Package
[Postman MVC WebApi Help Documentation](https://www.nuget.org/packages/Postman.WebApi.HelpDocumentation)

Allows developers expose their WebAPI endpoints so they can be imported into postman as a collection.
It generates json that conforms to the [Postman Collection Format v1.0.0](https://schema.getpostman.com/json/collection/latest/docs/index.html).

#### Source
It is based on the original answer to a question on Stack Overflow
[How to generate JSON Postman Collections from a WebApi2 project using WebApi HelpPages that are suitable for import](http://stackoverflow.com/questions/23158379/how-to-generate-json-postman-collections-from-a-webapi2-project-using-webapi-hel) by [Robert H. Engelhardt (rheone)](http://stackoverflow.com/users/1090923/rheone) and is released under a [Creative Commons Attribution-ShareAlike 3.0 Unported](https://creativecommons.org/licenses/by-sa/3.0/) licnece.

##Getting Started

1) Install the Nuget package

    Install-Package Postman.WebApi.HelpDocumentation

2) Import Api into Postman

    Collections -> Import -> Import from a Url -> Success!

### Customization

Sometime one prefers to use a "human friendly" name for the requests.
To do so simply edit the PostManController constructor.

    public PostmanApiController()
    {
      _requestNamingStyle = RequestNamingStyle.Url;
    }

There are two options:
Url and ActionName (split on Uppercase and drops "Async" keyword.)

## Improve Documentation
### Enable Xml Comments
1.  Project Properties -> Build -> Tick "XML documentation file"
2.  Change location to **App_Data/XmlDocument.xml**
3.  **Project\Areas\HelpPage\App_Start\HelpPageConfig.cs**

    	config.SetDocumentationProvider(new XmlDocumentationProvider(HttpContext.Current.Server.MapPath("~/App_Data/XmlDocument.xml")));

5. Provide xml comments on controller and actions

### Provide Actual Types
If using *HttpRequestMessage* or *HttpResponseMessage* the documentation won't provide meaningful examples in either the Help Page or the Postman Help

To cater for this abstration you can configure the WebApi Help with the actual types

#### Requests
**Project\Areas\HelpPage\App_Start\HelpPageConfig.cs**

    config.SetActualRequestType(typeof(MyType), "MyController", "MyAction");

#### Responses
**Project\Areas\HelpPage\App_Start\HelpPageConfig.cs**

    config.SetActualResponseType(typeof(MyType), "MyController", "MyAction");

*or*

Use the [ResponseType](http://msdn.microsoft.com/en-us/library/system.web.http.description.responsetypeattribute(v=vs.118).aspx) attribute on the action

    [ResponseType(typeof(MyType))]
    public HttpResponseMessage Post(HttpRequestMessage request)
    {
    }

### Sample Data
Sometimes the default values for types are not good enough so it is useful to post meaningful sample data.

**Project\Areas\HelpPage\App_Start\HelpPageConfig.cs**

    config.SetSampleObjects(new Dictionary<Type, object>
    {
      {
        typeof(Person), new Person
        {
           Id =  1,
           Firstname =  "Abbott",
           Surname =  "Robertson",
        }
      }
    });



### Changelog ###
#### 1.0.0.7 ####
- Corrected licensing issue

#### 1.0.0.6 ####
- Made sure schema conformed to Postman json schema file

#### 1.0.0.5 ####
- Allow a customisation of the request naming style. Url or Action Name.

#### 1.0.0.4 ####
- Tweaked namespaces that shouldn't have been there

#### 1.0.0.3 ####
- Json format updated to be work in new Postman packaged app

## Contributing ##
### Building Package ###

    NuGet.exe pack deploy\Postman.WebApi.HelpDocumentation.nuspec -OutputDirectory dist\