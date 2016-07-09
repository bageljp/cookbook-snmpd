What's ?
===============
chef で使用する snmpd の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "snmpd", git: "https://github.com/bageljp/cookbook-snmpd.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "snmpd" => {
    "manage_ip" => "172.31.0.101"
  }
)
```

Recipes
----------

#### snmpd::default
snmpd のインストールと設定。

#### snmpd::tomcat
sTtomcat監視用のACL設定。

#### snmpd::mib
展示などで使用しているNW機器のsnmp監視用設定。

Attributes
----------

主要なやつのみ。

#### snmpd::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['snmpd']['manage_ip']</tt></td>
    <td>string</td>
    <td>snmpd に問い合わせをしてくる監視サーバのIPアドレス。記載したIPアドレスからの問い合わせを許可する。</td>
  </tr>
</table>

TODO
----------

* MIB周りの設定が中途半端、、、まぁでもWebのSIだと使うことないしいっか。

