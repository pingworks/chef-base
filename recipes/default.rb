include_recipe 'pw_base::hosts'
include_recipe 'pw_base::resolv_conf'
include_recipe 'pw_base::apt'

include_recipe 'apt'

package 'vim'
package 'less'
package 'zip'
package 'unzip'
