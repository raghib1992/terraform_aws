variable "sample" {
    type = "string"
    default = "Hello Raghib"
}

variable "mymap" {
    type = map(string)
    default = {
        mykey = "my value"
    }
  
}

variable "mylist" {
    type = list
    default = [1,1,2,3,4,5]
  
}