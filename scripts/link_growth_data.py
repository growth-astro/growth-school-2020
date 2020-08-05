#!/usr/bin/env python
import os,sys,glob,shutil

origin = sys.argv[1]
dest = sys.argv[2]

for dirname, subdirlist, filelist in os.walk(origin):
    for subdir in subdirlist:
        if '.git' in subdir or '.ipynb_checkpoints' in subdir or '.git' in dirname or '.ipynb_checkpoints' in dirname:
            continue
        print(dirname,subdir)
        dir_origin = os.path.join(dirname,subdir)
        dir_dest = dir_origin.replace(origin,dest)

        if os.path.exists(dir_origin):
            print('Found directory: %s' % dir_origin)
            if not os.path.exists(dir_dest):
                print("\tDest directory %s doesn't exist: creating" % dir_dest)
                os.mkdir(dir_dest)
            else:
                print("\tDest directory already exists")

    for file in filelist:
        if file.startswith('.'):
            continue
        if '.git' in dirname or '.ipynb_checkpoints' in dirname:
            continue

        dir_origin = dirname
        dir_dest = dir_origin.replace(origin,dest)

        file_origin = os.path.join(dir_origin,file)
        file_dest = os.path.join(dir_dest,file)
        if not os.path.exists(file_dest):
            print('Copying file %s -> %s' % (file_origin, file_dest))
            shutil.copy(file_origin, file_dest)#!/usr/bin/env python
