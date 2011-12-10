create keyspace HiveMetaStore
  with placement_strategy = 'SimpleStrategy'
  and strategy_options = {replication_factor : 1}
  and durable_writes = true;

use HiveMetaStore;

create column family MetaStore
  with column_type = 'Standard'
  and comparator = 'UTF8Type'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'UTF8Type'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 200000.0
  and key_cache_save_period = 14400
  and read_repair_chance = 1.0
  and gc_grace = 864000
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy';



create keyspace cfs
  with placement_strategy = 'SimpleStrategy'
  and strategy_options = {replication_factor : 1}
  and durable_writes = true;

use cfs;

create column family cleanup
  with column_type = 'Standard'
  and comparator = 'BytesType'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 1000000.0
  and key_cache_save_period = 14400
  and read_repair_chance = 1.0
  and gc_grace = 60
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'Stores blocks row key to perform a cleanup for when jobs fail';

create column family inode
  with column_type = 'Standard'
  and comparator = 'DynamicCompositeType(t=>org.apache.cassandra.db.marshal.TimeUUIDType,s=>org.apache.cassandra.db.marshal.UTF8Type,b=>org.apache.cassandra.db.marshal.BytesType)'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 1000000.0
  and key_cache_save_period = 14400
  and read_repair_chance = 1.0
  and gc_grace = 60
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'Stores file meta data'
  and column_metadata = [
    {column_name : 'b@70617468',
    validation_class : BytesType,
    index_name : 'path',
    index_type : 0,
},
    {column_name : 'b@73656e74696e656c',
    validation_class : BytesType,
    index_name : 'sentinel',
    index_type : 0,
},
    {column_name : 'b@706172656e745f70617468',
    validation_class : BytesType,
    index_name : 'parent_path',
    index_type : 0,
}];

create column family inode_archive
  with column_type = 'Standard'
  and comparator = 'DynamicCompositeType(t=>org.apache.cassandra.db.marshal.TimeUUIDType,s=>org.apache.cassandra.db.marshal.UTF8Type,b=>org.apache.cassandra.db.marshal.BytesType)'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 1000000.0
  and key_cache_save_period = 14400
  and read_repair_chance = 1.0
  and gc_grace = 60
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'Stores file meta data'
  and column_metadata = [
    {column_name : 'b@70617468',
    validation_class : BytesType,
    index_name : 'path',
    index_type : 0,
},
    {column_name : 'b@73656e74696e656c',
    validation_class : BytesType,
    index_name : 'sentinel',
    index_type : 0,
},
    {column_name : 'b@706172656e745f70617468',
    validation_class : BytesType,
    index_name : 'parent_path',
    index_type : 0,
}];

create column family sblocks
  with column_type = 'Standard'
  and comparator = 'BytesType'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 1000000.0
  and key_cache_save_period = 14400
  and read_repair_chance = 1.0
  and gc_grace = 60
  and min_compaction_threshold = 16
  and max_compaction_threshold = 64
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'Stores blocks of information associated with a inode';

create column family sblocks_archive
  with column_type = 'Standard'
  and comparator = 'BytesType'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 1000000.0
  and key_cache_save_period = 14400
  and read_repair_chance = 1.0
  and gc_grace = 60
  and min_compaction_threshold = 0
  and max_compaction_threshold = 0
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'Stores blocks of information associated with a inode';



create keyspace dse_system
  with placement_strategy = 'SimpleStrategy'
  and strategy_options = {replication_factor : 1, currentJobTracker : 10.209.174.47}
  and durable_writes = true;

use dse_system;



create keyspace system
  with placement_strategy = 'LocalStrategy'
  and strategy_options = {replication_factor : 1}
  and durable_writes = false;

use system;

create column family HintsColumnFamily
  with column_type = 'Super'
  and comparator = 'BytesType'
  and subcomparator = 'BytesType'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 0.01
  and key_cache_save_period = 0
  and read_repair_chance = 0.0
  and gc_grace = 0
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'hinted handoff data';

create column family IndexInfo
  with column_type = 'Standard'
  and comparator = 'UTF8Type'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 0.01
  and key_cache_save_period = 0
  and read_repair_chance = 0.0
  and gc_grace = 0
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'indexes that have been completed';

create column family LocationInfo
  with column_type = 'Standard'
  and comparator = 'BytesType'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 0.01
  and key_cache_save_period = 0
  and read_repair_chance = 0.0
  and gc_grace = 0
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'persistent metadata for the local node';

create column family Migrations
  with column_type = 'Standard'
  and comparator = 'TimeUUIDType'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 0.01
  and key_cache_save_period = 0
  and read_repair_chance = 0.0
  and gc_grace = 0
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'individual schema mutations';

create column family NodeIdInfo
  with column_type = 'Standard'
  and comparator = 'TimeUUIDType'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 0.01
  and key_cache_save_period = 0
  and read_repair_chance = 0.0
  and gc_grace = 0
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'nodeId and their metadata';

create column family Schema
  with column_type = 'Standard'
  and comparator = 'UTF8Type'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'BytesType'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 0.01
  and key_cache_save_period = 0
  and read_repair_chance = 0.0
  and gc_grace = 0
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'current state of the schema';

create column family Versions
  with column_type = 'Standard'
  and comparator = 'UTF8Type'
  and default_validation_class = 'BytesType'
  and key_validation_class = 'UTF8Type'
  and rows_cached = 0.0
  and row_cache_save_period = 0
  and row_cache_keys_to_save = 2147483647
  and keys_cached = 0.01
  and key_cache_save_period = 0
  and read_repair_chance = 0.0
  and gc_grace = 0
  and min_compaction_threshold = 4
  and max_compaction_threshold = 32
  and replicate_on_write = true
  and row_cache_provider = 'SerializingCacheProvider'
  and compaction_strategy = 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy'
  and comment = 'server version information'
  and column_metadata = [
    {column_name : 'version',
    validation_class : UTF8Type}];
