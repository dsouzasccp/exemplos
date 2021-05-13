# module "cluster" {
#     source              = "./cluster/"
#     cluster_name        = "${var.cluster_name}-${var.env}"
#     account_adtech      = var.account_adtech
#     env                 = var.env #values dev, stg or prod
#     eks_version         = var.eks_version

#     tags                = var.tags
# }

module "node-group" {
    source              = "./node-group"
    node_name           = "node-group-${var.cluster_name}-${var.env}"
    cluster_name        = "${var.cluster_name}"
    # cluster_name        = "${var.cluster_name}-${var.env}"
    account_adtech      = var.account_adtech
    env                 = var.env #values dev, stg or prod
    instance_type       = var.instance_type
    disk_size           = var.disk_size
    key_pair            = var.account_adtech ? "tvg-dev" : "cluster-apps"
    auto_scale_options  = var.auto_scale_options
    eks_version         = var.eks_version

    tags                = var.tags

}