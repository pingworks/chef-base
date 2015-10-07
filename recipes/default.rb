include_recipe 'pw_base::hosts'
include_recipe 'pw_base::resolv_conf'
include_recipe 'pw_base::apt'

package 'vim'
package 'less'
package 'zip'
package 'unzip'
