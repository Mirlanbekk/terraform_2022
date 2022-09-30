from pydoc import describe
import boto3

session = boto3.Session(profile_name='s3')  #I create session from aws credent profile.

mirlan = session.client('s3')  

def upload_object():
    upload = mirlan.put_object(
        ACL='private',
        Key="hello.world.txt",
        Bucket='mir-test123456'
    )
    #print(upload)

    list = mirlan.list_objects_v2(
        Bucket='mir-test123456',
        
    )
    print(list['Contents'][0]['Key'])   


def remove_object():
    remove = mirlan.delete_object(
        Bucket='mir-test123456',
        Key='hello.world.txt',
    )
    print(remove)

def describe_object():
    describe = mirlan.get_object(
        Bucket='mir-test123456',
        Key='hello.world.txt',
    )    
    print(describe)



def main():
    remove_object()
    #upload_object()
    #describe_object()


main()








