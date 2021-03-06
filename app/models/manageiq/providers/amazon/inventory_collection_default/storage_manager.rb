class ManageIQ::Providers::Amazon::InventoryCollectionDefault::StorageManager < ManagerRefresh::InventoryCollectionDefault::StorageManager
  class << self
    def cloud_volumes(extra_attributes = {})
      attributes = {
        :model_class                 => ::ManageIQ::Providers::Amazon::StorageManager::Ebs::CloudVolume,
        :inventory_object_attributes => [
          :type,
          :ext_management_system,
          :ems_ref,
          :name,
          :status,
          :creation_time,
          :volume_type,
          :size,
          :base_snapshot,
          :availability_zone,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def cloud_volume_snapshots(extra_attributes = {})
      attributes = {
        :model_class                 => ::ManageIQ::Providers::Amazon::StorageManager::Ebs::CloudVolumeSnapshot,
        :inventory_object_attributes => [
          :type,
          :ext_management_system,
          :ems_ref,
          :name,
          :status,
          :creation_time,
          :description,
          :size,
          :cloud_volume,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def cloud_object_store_containers(extra_attributes = {})
      attributes = {
        :model_class                 => ::ManageIQ::Providers::Amazon::StorageManager::S3::CloudObjectStoreContainer,
        :inventory_object_attributes => [
          :ext_management_system,
          :ems_ref,
          :key,
          :bytes,
          :object_count,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end

    def cloud_object_store_objects(extra_attributes = {})
      attributes = {
        :model_class                 => ::ManageIQ::Providers::Amazon::StorageManager::S3::CloudObjectStoreObject,
        :inventory_object_attributes => [
          :ext_management_system,
          :ems_ref,
          :etag,
          :last_modified,
          :content_length,
          :key,
          :cloud_object_store_container,
        ]
      }

      super(attributes.merge!(extra_attributes))
    end
  end
end
