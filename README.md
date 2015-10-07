# pw_base-cookbook

base cookbook to setup hosts file and name resolution

## Supported Platforms

Ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pw_base']['cname']</tt></td>
    <td>String</td>
    <td>cname for the host</td>
    <td><tt>test</tt></td>
  </tr>
  <tr>
    <td><tt>['pw_base']['domain']</tt></td>
    <td>String</td>
    <td>domain name for the hosts file and search domain</td>
    <td><tt>ws.pingworks.net</tt></td>
  </tr>
  <tr>
    <td><tt>['pw_base']['dns']</tt></td>
    <td>String</td>
    <td>primary dns ip</td>
    <td><tt>10.33.0.10</tt></td>
  </tr>
</table>

## Usage

### base::default

Include `pw_base` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[pw_base::default]"
  ]
}
```

## License and Authors

Author:: Christoph Lukas (<christoph.lukas@gmx.net>)
