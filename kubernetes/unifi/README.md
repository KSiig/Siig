# Preparing MongoDB

When the mongo database has been set up, it still needs a bit of configuration, before it will work with unifi. Open a mongo shell, and follow this:

> Get instructions on how to get shell by using the `helm status unifi-mongodb` command

```
# first, make sure we're using the unifi database
> use unifi
# next, grant the correct permissions
> db.grantRolesToUser("unifi", [ 
  { db: "unifi", role: "dbOwner" },
  { db: "unifi_stat", role: "dbOwner" },
  { db: "admin", role: "clusterMonitor" }
  ]);
# now verify
> > db.getUser("unifi");
`` 