Postman WebApi Help Documentation
================================

### Nuget Package
[Postman MVC WebApi Help Documentation](https://www.nuget.org/packages/Postman.WebApi.HelpDocumentation)

Allows developers expose their WebAPI endpoints so they can be imported into postman as a collection

It is based on the original answer to a question on Stack Overflow
[How to generate JSON Postman Collections from a WebApi2 project using WebApi HelpPages that are suitable for import](http://stackoverflow.com/questions/23158379/how-to-generate-json-postman-collections-from-a-webapi2-project-using-webapi-hel)

##Getting Started

1) Install the Nuget package

    Install-Package Postman.WebApi.HelpDocumentation

2) Import Api into Postman

    Collections -> Import -> Import from a Url -> Success!

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
