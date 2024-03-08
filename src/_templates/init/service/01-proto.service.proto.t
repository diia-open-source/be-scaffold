---
to:  <%= serviceName %>/proto/<%= h.changeCase.snakeCase(serviceName) %>.proto
---

syntax = "proto3";

package ua.gov.diia.<%= h.changeCase.pascalCase(serviceName).toLowerCase() %>;
option java_multiple_files = true;
option java_package = "ua.gov.diia.<%= h.changeCase.pascalCase(serviceName).toLowerCase() %>";

service <%= h.changeCase.pascalCase(serviceName) %> {
    rpc GetAddResult(GetAddResultRequest) returns (GetAddResultResponse);
}

message GetAddResultRequest {
    int32 a = 1;
    int32 b = 2;
}

message GetAddResultResponse {
    int32 result = 1;
}
