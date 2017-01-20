module SoftDeletable
  extend ActiveSupport::Concern

  included do
    default_scope { without_deleted }

    scope :deleted, -> { where.not(deleted_at: nil) }
    scope :without_deleted, -> { where(deleted_at: nil) }
    scope :with_deleted, -> { unscope(where: :deleted_at).all }
  end

  def deleted?
    deleted_at?
  end

  def destroy
    update_column(:deleted_at, Time.zone.now)
  end

  # Call destroy on superclass
  def destroy!
    method(:destroy).super_method.call
  end

  def restore
    update_column(:deleted_at, nil)
  end
end
