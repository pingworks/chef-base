include_recipe 'pw_base::hosts'
include_recipe 'pw_base::resolv_conf'
include_recipe 'pw_base::apt'
include_recipe 'pw_base::gemrc'

package 'vim'
package 'less'
package 'zip'
package 'unzip'
