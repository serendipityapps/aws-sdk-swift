// Code generated by smithy-swift-codegen. DO NOT EDIT!

import ClientRuntime

/// AWS Supply Chain is a cloud-based application that works with your enterprise resource planning (ERP) and supply chain management systems. Using AWS Supply Chain, you can connect and extract your inventory, supply, and demand related data from existing ERP or supply chain systems into a single data model. The AWS Supply Chain API supports configuration data import for Supply Planning. All AWS Supply chain API operations are Amazon-authenticated and certificate-signed. They not only require the use of the AWS SDK, but also allow for the exclusive use of AWS Identity and Access Management users and roles to help facilitate access, trust, and permission policies.
public protocol SupplyChainClientProtocol {
    /// Performs the `CreateBillOfMaterialsImportJob` operation on the `GalaxyPublicAPIGateway` service.
    ///
    /// CreateBillOfMaterialsImportJob creates an import job for the Product Bill Of Materials (BOM) entity. For information on the product_bom entity, see the AWS Supply Chain User Guide. The CSV file must be located in an Amazon S3 location accessible to AWS Supply Chain. It is recommended to use the same Amazon S3 bucket created during your AWS Supply Chain instance creation.
    ///
    /// - Parameter CreateBillOfMaterialsImportJobInput : The request parameters for CreateBillOfMaterialsImportJob.
    ///
    /// - Returns: `CreateBillOfMaterialsImportJobOutput` : The response parameters of CreateBillOfMaterialsImportJob.
    ///
    /// - Throws: One of the exceptions listed below __Possible Exceptions__.
    ///
    /// __Possible Exceptions:__
    /// - `AccessDeniedException` : You do not have the required privileges to perform this action.
    /// - `ConflictException` : Updating or deleting a resource can cause an inconsistent state.
    /// - `InternalServerException` : Unexpected error during processing of request.
    /// - `ResourceNotFoundException` : Request references a resource which does not exist.
    /// - `ServiceQuotaExceededException` : Request would cause a service quota to be exceeded.
    /// - `ThrottlingException` : Request was denied due to request throttling.
    /// - `ValidationException` : The input does not satisfy the constraints specified by an AWS service.
    func createBillOfMaterialsImportJob(input: CreateBillOfMaterialsImportJobInput) async throws -> CreateBillOfMaterialsImportJobOutput
    /// Performs the `GetBillOfMaterialsImportJob` operation on the `GalaxyPublicAPIGateway` service.
    ///
    /// Get status and details of a BillOfMaterialsImportJob.
    ///
    /// - Parameter GetBillOfMaterialsImportJobInput : The request parameters for GetBillOfMaterialsImportJob.
    ///
    /// - Returns: `GetBillOfMaterialsImportJobOutput` : The response parameters for GetBillOfMaterialsImportJob.
    ///
    /// - Throws: One of the exceptions listed below __Possible Exceptions__.
    ///
    /// __Possible Exceptions:__
    /// - `AccessDeniedException` : You do not have the required privileges to perform this action.
    /// - `ConflictException` : Updating or deleting a resource can cause an inconsistent state.
    /// - `InternalServerException` : Unexpected error during processing of request.
    /// - `ResourceNotFoundException` : Request references a resource which does not exist.
    /// - `ServiceQuotaExceededException` : Request would cause a service quota to be exceeded.
    /// - `ThrottlingException` : Request was denied due to request throttling.
    /// - `ValidationException` : The input does not satisfy the constraints specified by an AWS service.
    func getBillOfMaterialsImportJob(input: GetBillOfMaterialsImportJobInput) async throws -> GetBillOfMaterialsImportJobOutput
}

public enum SupplyChainClientTypes {}
