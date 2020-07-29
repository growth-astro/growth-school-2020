log_dir=/home/admin/logs
mkdir -p $log_dir

if [ -f /home/admin/start/as-root.sh ]; then
    log_file=$log_dir/$NB_USER-as-root.log
    touch $log_file
    sudo -E -H -u root /home/admin/start/as-root.sh | tee $log_file
    sudo -E -H -u root chown admin:admin $log_file
    sudo -E -H -u root chmod o-rwx $log_file
fi

if [ -f /home/admin/start/as-user.sh ]; then
    log_file=$log_dir/$NB_USER-as-user.log
    touch $log_file
    sudo -E -H -u $NB_USER /home/admin/start/as-user.sh | tee $log_file
    sudo -E -H -u root chown admin:admin $log_file
    sudo -E -H -u root chmod o-rwx $log_file
fi

