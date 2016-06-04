class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.
    if user.blank?                        # not logged in
      cannot :manage, :all                # 解除所有權限
      guest_permission                    # call 基本權限設定
    elsif user.has_role?(:admin)          # role 為 admin
      admin_permission                    # 擁有所有權限
    elsif user.has_role?(:director)       # role 為 director
      director_permission                 # 擁有部分權限
    elsif user.has_role?(:member)         # role 為 member
      member_permission                   # 擁有部分權限
    end
  end

  protected

  def guest_permission
    can :read, Faq
  end

  def member_permission
    can :read, Faq
  end

  def director_permission
    can :read, Faq
    # can [:create, :update], [Group, Post, Comment]
  end

  def admin_permission
    can :manage, :all
  end

    # user ||= User.new # guest user (not logged in)
    # if user.admin?
    #   can :manage, :all
    # else
    #   can :read, :all
    # end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
