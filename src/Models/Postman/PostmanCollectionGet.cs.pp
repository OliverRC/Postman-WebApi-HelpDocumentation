using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace $rootnamespace$.Models.Postman
{
  // <summary>
  ///     [Postman](http://getpostman.com) collection representation
  /// </summary>
  public class PostmanCollectionGet
  {
    /// <summary>
    ///     Id of collection
    /// </summary>
    [JsonProperty(PropertyName = "id")]
    public Guid Id { get; set; }

    /// <summary>
    ///     Name of collection
    /// </summary>
    [JsonProperty(PropertyName = "name")]
    public string Name { get; set; }

    /// <summary>
    ///     Description of collection
    /// </summary>
    [JsonProperty(PropertyName = "description")]
    public string Description { get; set; }

    /// <summary>
    ///     ordered list of ids of items in the collection
    /// </summary>
    [JsonProperty(PropertyName = "order")]
    public ICollection<Guid> Order { get; set; }

    /// <summary>
    ///     folders within the collection
    /// </summary>
    [JsonProperty(PropertyName = "folders")]
    public ICollection<PostmanFolderGet> Folders { get; set; }

    /// <summary>
    ///     Collection generation time
    /// </summary>
    [JsonProperty(PropertyName = "timestamp")]
    public long Timestamp { get; set; }

    /// <summary>
    ///     **unused always false**
    /// </summary>
    [JsonProperty(PropertyName = "synced")]
    public bool Synced { get; set; }

    /// <summary>
    ///     Requests associated with the collection
    /// </summary>
    [JsonProperty(PropertyName = "requests")]
    public ICollection<PostmanRequestGet> Requests { get; set; }
  }
}