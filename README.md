# chef-pdns-cookbook

Simple cookbook to bring up powerdns with mysql backend.

Please, don't use it in production environments.
FOR TESTS ONLY!

You have been warned.

## Requirements
-----
Depends on opscode cookbooks:
- apt
- yum
- yum-epel
- mysql
- database

## Supported Platforms
-----
Tested and runs on:
- Ubuntu 12.04
- Ubuntu 14.04
- CentOS 6.5

## Attributes
-----
TODO

## Usage
-----
### chef-pdns::default

Include `chef-pdns` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[chef-pdns::default]"
  ]
}
```

## Contributing
-----
1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors
-----
- Author:: SiruS (https://github.com/podwhitehawk)
```text
Copyright (C) 2014 SiruS (https://github.com/podwhitehawk)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
