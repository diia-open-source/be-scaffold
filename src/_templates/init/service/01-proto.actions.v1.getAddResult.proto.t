---
to:  <%= serviceName %>/proto/actions/v1/getAddResult.proto
---

syntax = "proto3";

package ua.gov.diia.<%= h.changeCase.pascalCase(serviceName).toLowerCase() %>;

option java_multiple_files = true;
option java_package = "ua.gov.diia.<%= h.changeCase.pascalCase(serviceName).toLowerCase() %>";

message GetAddResultReq {
  int32 a = 1;
  int32 b = 2;
}

message GetAddResultRes {
  int32 result = 1;
}
