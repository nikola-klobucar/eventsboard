class EventPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
          scope.all
        end
    end

    def index?
        true
    end

    def show?
        scope.where(:id => event.id).exists?
    end

    def create?
        user.present?
    end

    def new?
        create?
    end

    def update?
        (user.present? && user == event.organizer) || user.try(:admin?)
    end

    def edit?
        update?
    end

    def destroy?
        (user.present? && user == event.organizer) || user.try(:admin?)
    end

    private

        def event
            record
        end
end
