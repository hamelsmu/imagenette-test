for d in */ ; do
    tar czf "${d%?}".tgz $d
done

awscp ()
{
    aws s3 cp $1 s3://fast-ai-$2/ --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
}

for d in *.tgz; do
    awscp $d "imageclas"
done
